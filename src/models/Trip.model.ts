//trip model

import {Media} from './Media.model';
import {Place} from './Place.model';

export interface TripData {
  id: number;
  user_id: number;
  title: string;
  description: string;
  start_date: string;
  end_date: string;
  created_at: string;
  updated_at: string;
  Places: Place[];
  Media: Media[];
}
